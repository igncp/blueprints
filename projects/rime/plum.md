# Plum

The main `README.md` has an overview of several concepts:

- Schema: in a `*.schema.yaml` file, for example `/usr/share/rime-data/terra_pinyin.schema.yaml`
- Dictionary: in a `*.dict.yaml` file, for example `/usr/share/rime-data/terra_pinyin.dict.yaml`
- Recipe: Reusable piece of configuration

The repository has a main script called `rime-install`, but this calls several scripts inside `scripts`.

This repository only consists of shell scripts and some configuration files. These scripts fetch other repositories to automate downloading the yaml configuration files for each schema. There is some duplication to support running these from windows.
