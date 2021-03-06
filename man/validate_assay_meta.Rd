% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate-by-file.R
\name{validate_assay_meta}
\alias{validate_assay_meta}
\title{Validation of assay metadata}
\usage{
validate_assay_meta(assay, template, annotations, syn)
}
\arguments{
\item{assay}{Assay metadata in dataframe.}

\item{template}{The assay template.}

\item{annotations}{A data frame of annotation definitions.
Must contain at least three columns: key, value, and columnType.}

\item{syn}{Synapse client object.}
}
\value{
List of condition objects indicating whether the assay
  has passed each validation check.
}
\description{
Validates the assay metadata according to specific
requirements and returns list of results.
}
