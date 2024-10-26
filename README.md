# BIOL2033: Insect collection tracker + label generator

## Overview
Welcome! You've landed on the right flower for getting your D's and HD's in Caitlyn Forster's beloved Biology of Insects unit. Gone are the days of searching your camera rolls (and dare I say text messages) for hints of a insect's collection date or GPS coords, of massaging your sore wrists after the 30th handwritten label is *finally* done, or making duplicate uploads of an insect specimen on iNaturalist (omg, so boomer). 

Welcome, to peace.

## Project description
In this project you'll find three files: a spreadsheet, an R script, and word document. The files are compatible with other software if you don't have MS Office (e.g., Numbers and Pages for MacOS, Google Docs and Sheets for Google Suite).

It offers an easy way to keep track of your insect collection as it grows and print labels. It also allows you to be flexible with the labels (you can adjust the formatting according to your needs).

1. insects.xlsx - Track your insect collection as it grows, or chuck all your info in on the day. 
2. generating-labels.R - Generate your labels in one click from your heavy spreadsheet.
3. labels.docx - Paste, print, and cut your labels.

## How to use
### 1. Setup
Download the project as a ZIP file through the Code button. Unzip and move the "insects" folder to a convenient location on your computer.

<img width="500" alt="setup" src="https://github.com/user-attachments/assets/9d042a03-d32c-4812-9ab5-78dcfc91fb75">

### 2. Insect collection tracker
In "insects.xlsx", populate the columns with your specimen details. The essential columns are highlighted in gold. Formatting is not carried over through the script, but capitalisation and spelling are.

<img width="1440" alt="spreadsheet" src="https://github.com/user-attachments/assets/e0a62b67-160a-4486-8628-b923716ac02a">

### 3. Label generation
Open the R script and run it. The output will be copied to your clipboard.

By default, the labels will be printed in the format *Order, Family*. If you only wish to include family change line 4 to `order=FALSE`.

<img width="500" alt="order" src="https://github.com/user-attachments/assets/c325811b-24e4-464b-a77c-4eb8fe1f3266">

### 4. Label printing
Open the Word document and paste using CMD+SHIFT+V to preserve the document formatting. You may have to watch for labels being cut off at the starts of columns. I haven't figured out how to fix that yet (suggestions open!). 

You can adjust the formatting according to your needs, but I've put it as Times New Roman, font size 4px, with 6 margins. This allows you to print 168 (28x6) labels per page. 

Save the Word document as a PDF and print. You now have physical labels!

<img width="900" alt="labels" src="https://github.com/user-attachments/assets/2731a279-9e42-4fa5-84d5-dde63bc9312b">

## Credits
Massive thanks to Caitlyn Forster and the teaching team at BIOL2033 for running such a fantastic unit. The passion and expertise of everyone involved was unmatched and I enjoyed every minute spent in class or on assignments. 

The Skeptical Moth and UC Riverside's Entomology Research Museum helped me decide what to/not to include in my labels.

## Helpful links
Future intakes of BIOL2033 may find the following websites immensely helpful. I certainly know I did:

* [How to Collect and Preserve Insects by H.H. Ross](https://www.gutenberg.org/cache/epub/59883/pg59883-images.html)
* [Identification tips for common families of insect predators](https://entomology.ces.ncsu.edu/biological-control-information-center/beneficial-predators/)
* [Common families of 29 insect orders](https://genent.cals.ncsu.edu/insect-identification/thumbnail-view/)
* [Labelling, pinning, and point mounting](https://entmuseum.ucr.edu/guides-faqs/specimen-preparation#when_to_pin)
