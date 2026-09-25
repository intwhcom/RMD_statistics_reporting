library(readxl)
library(dplyr)
library(stringr)
library(flextable)
library(officer)

# Read data
df <- read_excel("C:\\Users\\IsidoraKatara\\OneDrive - International Whaling Commission\\Catch Data WF\\Summary\\catches-postMoratorium-V7-2-2025.xlsx", sheet = 1)

df <- df %>% filter(Yearfile == 2025)

# Clean and prepare
df2 <- df %>%
  mutate(
    Ty = str_trim(Ty),
    N = as.character(N),
    
    Area_final = case_when(
      Admin_Reg == "Japan" & Area == "Japan" ~ "Japan coastal",
      Admin_Reg == "Japan" & Area != "Japan" ~ "Offshore whaling",
      TRUE ~ Area
    ),
    
    Nation_final = Nation_L
  ) %>%
  filter(Ty %in% c("AS", "WO", "WR", "Inf", "M", "C")) %>%
  mutate(
    Main_group = case_when(
      Nation_final %in% c("Japan", "Canada") ~ 
        "Non-member nations reporting to IWC",
      TRUE ~ 
        "Member Nations"
    ),
    
    Operation_group = case_when(
      Ty == "AS"  ~ "Aboriginal subsistence whaling",
      Ty == "WO"  ~ "Whaling under objection",
      Ty == "WR"  ~ "Whaling under reservation",
      Ty == "Inf" ~ "Illegal catches",
      Ty == "M"   ~ "Non-commercial catches",
      Ty == "C"   ~ "Commercial whaling"
    )
  )

# Summarise catches
summary_table <- df2 %>%
  group_by(Main_group, Operation_group, Area_final, Nation_final) %>%
  summarise(
    Fin = sum(Fin, na.rm = TRUE),
    Humpback = sum(Hbk, na.rm = TRUE),
    Sei = sum(Sei, na.rm = TRUE),
    `Bryde’s` = sum(Bryd, na.rm = TRUE),
    `Common Minke` = sum(CMi, na.rm = TRUE),
    Gray = sum(Gray, na.rm = TRUE),
    Bowhead = sum(Bhd, na.rm = TRUE),
    Total = sum(Total, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  rename(
    Area = Area_final,
    Nation = Nation_final
  )

# Add section headings
table_for_word <- summary_table %>%
  arrange(Main_group, Operation_group, Area, Nation) %>%
  group_split(Main_group, Operation_group) %>%
  lapply(function(x) {
    
    header1 <- tibble(
      Area = unique(x$Main_group),
      Nation = "",
      Fin = NA, Humpback = NA, Sei = NA, `Bryde’s` = NA,
      `Common Minke` = NA, Gray = NA, Bowhead = NA, Total = NA
    )
    
    header2 <- tibble(
      Area = unique(x$Operation_group),
      Nation = "",
      Fin = NA, Humpback = NA, Sei = NA, `Bryde’s` = NA,
      `Common Minke` = NA, Gray = NA, Bowhead = NA, Total = NA
    )
    
    bind_rows(
      header1,
      header2,
      x %>%
        select(Area, Nation, Fin, Humpback, Sei, `Bryde’s`,
               `Common Minke`, Gray, Bowhead, Total)
    )
  }) %>%
  bind_rows()

# Export to Word
ft <- flextable(table_for_word) %>%
  autofit() %>%
  bold(i = which(table_for_word$Nation == ""), bold = TRUE) %>%
  bg(i = which(table_for_word$Nation == ""), bg = "#E8E8E8") %>%
  align(align = "center", part = "all") %>%
  align(j = c("Area", "Nation"), align = "left", part = "all") %>%
  colformat_num(
    j = c("Fin", "Humpback", "Sei", "Bryde’s",
          "Common Minke", "Gray", "Bowhead", "Total"),
    digits = 0
  )

doc <- read_docx() %>%
  body_add_par("Whaling catches summary", style = "heading 1") %>%
  body_add_flextable(ft)

print(doc, target = "C:\\Users\\IsidoraKatara\\OneDrive - International Whaling Commission\\TablesforSCreports\\temp\\whaling_summary_table.docx")
