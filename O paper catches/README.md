# O Paper Catches

This folder contains the R Markdown workflow used to prepare catch-reporting material for Scientific Committee O papers.

## Main file

```text
Report.Rmd
```

The report produces an annual summary of catches reported to the IWC for a selected season.

## Reporting year

The report is parameterised so that the reporting season can be selected when the document is rendered.

The reporting year should be checked before producing a new version.

## Inputs

The workflow uses files stored in:

```text
../inputs/
```

These include:

```text
catches-postMoratorium-test.xlsx
catches-bysex-test.xlsx
NationsMembership.xlsx
```

Operational equivalents can be used locally when preparing the final report.

## Catch information

The workflow uses the post-moratorium catch dataset to summarise reported catches.

The reporting structure includes information such as:

- reporting administration;
- IWC membership status;
- catch type;
- area;
- species;
- total catches or strikes;
- struck-and-lost animals;
- landed animals; and
- sex composition where available.

## Membership

The workflow uses `NationsMembership.xlsx` to determine membership status at the relevant time.

This allows catches to be presented appropriately for member and non-member reporting categories.

## Output

The R Markdown file produces a Word document containing the annual catch-reporting tables and associated text.

Before finalising the report, check:

- reporting year;
- membership classifications;
- species totals;
- struck-and-lost values;
- sex information;
- table captions;
- footnotes and explanatory text;
- Word formatting.

## Testing

The mock catch and catch-by-sex datasets in `inputs/` can be used to test the workflow before running it with operational data.

The `.Rmd` file should remain the primary source for the report so that the annual workflow remains reproducible.
