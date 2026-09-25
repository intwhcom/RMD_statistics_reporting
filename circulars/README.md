# Circulars

This folder contains R Markdown workflows used to prepare recurring IWC Circular Communications.

Each workflow combines an `.Rmd` source file with a Word reference document that provides the required IWC document layout and formatting.

## Current circulars

### Catch data and infractions

Files include:

```text
catches and infractions.Rmd
catches and infractions template.docx
```

This workflow produces a Circular Communication requesting catch data and reports of infractions for the previous season.

The circular includes the reporting season, submission deadline, relevant reporting obligations and links to the infractions reporting form and checklist.

### Scientific Progress Reports

Files include:

```text
progress reports.Rmd
progress reports template.docx
```

This workflow produces a Circular Communication requesting submission of national Scientific Progress Reports.

The circular describes the role of Scientific Progress Reports, the type of information requested and the submission process.

### Whale Killing Methods and Welfare Issues

Files include:

```text
WKM and welfare.Rmd
WKM and welfare template.docx
```

This workflow produces the recurring call for information on whale killing methods and welfare issues.

The circular requests information on whale killing and welfare statistics and refers to the relevant Summary Reporting Form.

## Supporting files

The circulars use supporting files from:

```text
../inputs/
```

These include placeholder signature images such as:

```text
image1.png
image2.png
```

These are used only for testing and document generation.

## Word templates

Each circular uses its corresponding `.docx` file as a `reference_docx`.

For example:

```yaml
output:
  word_document:
    reference_docx: "catches and infractions template.docx"
```

The Word reference document controls elements such as:

- IWC letterhead;
- headers and footers;
- page layout;
- fonts;
- standard document formatting.

## Updating a circular

Before producing a new circular:

1. check the reporting year;
2. check the submission deadline;
3. check the circular reference number;
4. check the initials/reference code;
5. check URLs and email addresses;
6. replace placeholder signatory details where necessary;
7. check the signature image;
8. render the Word document;
9. compare the result with the required IWC format
10. check the names of chairs and exec secretary in the footer

Some fields intentionally remain as placeholders, for example:

```text
[INSERT NUMBER]
NAME
```

These should be reviewed before the circular is issued.

## Generated files

Rendered `.docx` and `.md` files may be retained during development for checking against the source R Markdown and Word template.

The `.Rmd` files should remain the primary editable source.
