# Inputs

This folder contains the supporting data and files required by the reporting workflows in this repository.

The datasets included here are primarily mock or synthetic files intended to reproduce the structure expected by the scripts without requiring operational reporting data.

## Current files

### `catches-postMoratorium-test.xlsx`

Mock catch dataset used by catch-reporting scripts.

It reproduces the structure expected by the post-moratorium catches workflows, including variables for:

- reporting year and season;
- administrative region;
- area;
- catch type;
- species-specific catches;
- total strikes;
- struck-and-lost catches;
- notes; and
- other reporting information.

### `catches-bysex-test.xlsx`

Mock catch-by-sex dataset used in catch-reporting workflows where the sex composition of catches is required.

### `Infractions_master_table_SYNTHETIC.xlsx`

Synthetic infractions dataset used to test the infractions reporting workflows.

It allows the scripts to generate summary and detailed infractions tables without requiring operational infractions data.

### `NationsMembership.xlsx`

IWC membership information.

This file is used by several workflows to determine whether an administration was an IWC member at the time of the reported catch or infraction.

### `word_styles.docx`

Word reference document used by some R Markdown reports to control Word formatting and table styles.

### `image1.png`

Placeholder signature image used for testing circular-generation workflows.

### `image2.png`

Second placeholder signature image used for testing circular-generation workflows.

## Mock data

The test datasets should maintain the same:

- column names;
- data types;
- general structure; and
- expected coding conventions

as the operational datasets used by the Secretariat.

This allows the reporting scripts to be developed and tested safely.

## Operational data

Operational, confidential or personal data should not be committed to a public GitHub repository.

When operational datasets are used, they can replace the mock files locally or the input paths in the relevant scripts can be changed.

## File names

Several scripts refer directly to filenames in this folder.

For this reason, changing a filename may require updating the corresponding `.R` or `.Rmd` script.

Where possible, new reporting scripts should use YAML parameters or clearly defined input-path variables rather than hard-coded paths.
