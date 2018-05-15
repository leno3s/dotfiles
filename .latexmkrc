#!/usr/bin/env perl
$latex            = 'uplatex';
$latex_silent     = 'uplatex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$biber            = 'biber --bblencoding=utf8 -u -U --output_safechars';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 4;
$pdf_mode         = 3;
$pvc_view_file_via_temporary = 0;
$pdf_previewer    = "evince";

