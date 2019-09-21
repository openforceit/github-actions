#!/usr/bin/env bash
# Author(s): Andrea Colangelo (andreacolangelo@openforce.it)
# Copyright 2019 Openforce Srls Unipersonale (www.openforce.it)
# License LGPL-3.0 or later (https://www.gnu.org/licenses/lgpl).

setuptools-odoo-make-default --clean -d . --commit
cd setup

for dir in `ls -d */`;
do
  cd ${dir};
  python setup.py bdist_wheel
  cd ..
done;

