# Social Media and Web Analytics: Empirical Research Design

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![lifecycle](https://img.shields.io/badge/version-2024-red.svg)]()

## Learning Objectives

By the end of this class you should be able to:

* Sample members of a social network using an initial set of seed users
* Explain various descriptive measures of a network
* Compute descriptive statistics of a sample network
* Define network centrality
* Compute node's network centrality
* Explain intuitively how Louvain and Infomap algorithms split a network into communities
* Divide a network into communities using Louvain and Infomap algorithms

## Instructions for Students (Before Coming to Class)

### Accessing Materials & Following Along Live in Class

Clone a copy of this repository using Git.
To clone a copy of this repository to your own PC:

```{bash, eval = FALSE}
git clone git@github.com:tisem-digital-marketing/smwa-designing-research-code.git
```

Once you have cloned the files, open the cloned repository in RStudio as an RStudio project and use the empty R scripts to follow along with the lecture as we work through material.

At the conclusion of the class, the course instructor's scripts are made available in the branch `instructor`.
Recall that you can switch between branches using the `git branch <BRANCHNAME>` command in a terminal.
Thus to switch to the instructor branch:

```{bash}
git branch instructor
```

And to switch back to the branch that you worked through live in class:

```{bash}
git branch main
```

*NOTE*: Git does not like you to switch branches with uncommitted changes.
Before you switch branches, be sure to commit any changes to the files.

### Installing required packages

This lecture makes use of additional `R` packages.

Install these packages **before** coming to class.

## Meta-Information

* Module Maintainer: Lachlan Deer (`@lachlandeer`)
* Course: [Social Media and Web Analytics](https://tisem-digital-marketing.github.io/2024-smwa)
* Institute: Dept of Marketing, Tilburg University
* Current Version: [2024 edition](https://tisem-digital-marketing.github.io/2024-smwa)

## License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).

## Suggested Citation

Deer, Lachlan. 2024. Social Media and Web Analytics: Empirical Research Design -- Code. Tilburg University. url = "https://github.com/tisem-digital-marketing/smwa-designing-research-code"

```{r, engine='out', eval = FALSE}
@misc{smwa-researchdesign-2024,
      title={"Social Media and Web Analytics: Empirical Research Design -- Code"},
      author={Lachlan Deer},
      year={2024},
      url = "https://github.com/tisem-digital-marketing/smwa-designing-research-code"
}
```