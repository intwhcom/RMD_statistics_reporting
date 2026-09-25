# Catches and Infractions

This folder contains scripts used to prepare recurring IWC Secretariat outputs relating to reported whale catches and infractions.

The scripts use catch, infractions and membership information from the `inputs/` folder and generally produce Word documents for reporting or circulation.

## Main scripts

### `catch summary table ranges of years.Rmd`

Produces catch summary tables for a selected range of years.

The workflow reads catch data, identifies IWC membership status, summarises catches by reporting variables and creates formatted Word tables.

### `catches appendix for infractions report.rmd`

Produces the catches appendix used with the infractions report.

The output summarises reported catches by season, administration, area, catch type and species.

The current workflow includes:

- total strikes by species;
- struck-and-lost information where available;
- reporting nation membership status;
- catch type;
- administrative region;
- area; and
- associated notes.

### `infractions and catches paper on data reported to SEC.rmd`

Produces a combined Secretariat paper summarising catches and reported infractions for a selected reporting period.

The document includes annual catch tables and infractions tables.

### `infractions paper on data reported to SEC.rmd`

Produces the infractions component of the reporting workflow.

The scripts summarise reported infractions and provide more detailed information on individual reported cases where available.

### `catch tables for intersessional report.R`

Produces formatted catch tables for intersessional reporting.

The script groups catches by categories such as:

- member and non-member nations;
- whaling or catch type;
- area;
- nation; and
- species.

The resulting tables are exported to Word using `flextable` and `officer`.

## Inputs

The scripts use files stored in:

```text
../inputs/
```

Depending on the workflow, these include:

```text
NationsMembership.xlsx
catches-postMoratorium-test.xlsx
Infractions_master_table_SYNTHETIC.xlsx
word_styles.docx
```

The test catch and infractions datasets are mock or synthetic datasets intended for development and testing.

## Parameters

Several R Markdown files allow the reporting period to be controlled through YAML parameters such as:

```yaml
params:
  first_year: 2024
  last_year: 2025
```

These should be updated for each reporting cycle.

## Outputs

Generated reports should normally be written to:

```text
../outputs/
```

Before final use, check:

- reporting years;
- table numbering;
- table captions;
- species and catch-type labels;
- notes;
- membership classification;
- missing-value display;
- Word formatting.

## Important

The scripts depend on the expected structure and column names of the source datasets.

If the operational catch or infractions databases change, check the affected variable names before generating a new report.
