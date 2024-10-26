# Include order? ####
# TRUE (Orthoptera, Acrididae)
# FALSE (Family: Acrididae)
includeOrder=TRUE

# Importing ####
library(readxl)
library(tidyverse)

# Cleaning ####
x <- read_excel("insects.xlsx") |> janitor::clean_names() |>
  select(order, family, juvenile, sex,    # line 1
         country, state, suburb,          # line 2
         gps_coordinates,                 # line 3
         day, month, year, collector,     # line 4
         location_notes) |>               # line 5
  mutate(month=tolower(as.roman(month)))

# Missing data check ####
essential <- x[!grepl("*reared*", x$location_notes), # excludes lab-reared obs
               !names(x) %in% c("juvenile", "sex", # optional
                                "location_notes", # optional
                                "collector")] # optional

missing_cols <- toupper(colnames(essential[colSums(is.na(essential))>0]))

# Warnings ####
thanks="Have any comments or suggestions? Please fly me an email at tracyyao27@gmail.com :)"

finished <- function() {
  if (identical(missing_cols,character(0))) {
    # no columns with missing data
    cat("Your labels have been copied to your clipboard! Please paste into 'labels.docx' using CMD+SHIFT+V to preserve formatting.")
  } else {
    # list columns with missing data
    cat("Your labels have been copied to your clipboard! Please paste into 'labels.docx' using CMD+SHIFT+V to preserve formatting.", br,
        "Note: You have missing data in the following", 
        length(missing_cols), "columns: ",
        missing_cols)
  }
}

# Label generation* ####
# text shortcuts
br="\n"
colon=": "
comma=", "
dot="."
br1=" ("
br2=")"

# initialising output
output=""

# for each row in spreadsheet
for(i in 1:nrow(x)) {
  if (includeOrder==TRUE) {
    # 1: Orthoptera, Acrididae (♀) (Larvae) 
    output <- paste0(output, x$order[i], comma, x$family[i])
  } else {
    # 1: Family: Acrididae (♀) (Larvae)
    output <- paste0(output, "Family", colon, x$family[i]) 
  }
  if (!is.na(x$sex[i])) {
    output <- paste0(output, br1, x$sex[i], br2)
  } 
  if (!is.na(x$juvenile[i])) {
    output <- paste0(output, br1, x$juvenile[i], br2)
  } 
  output <- paste0(output, br)
  
  # 2: AUSTRALIA: NSW, Narrabri
  if (!is.na(x$suburb[i])) {
    output <- paste0(output, x$country[i], colon, x$state[i], 
                     comma, x$suburb[i], br)
  } else {
    # 2: AUSTRALIA: NSW (missing suburb)
    output <- paste0(output, x$country[i], colon, x$state[i], br)
  }
  
  if (grepl("reared", x$location_notes[i], fixed = TRUE)) {
    # 4: 11.ix.2024 (if reared, will only include date)
    if (!is.na(x$day[i]) & !is.na(x$month[i]) & !is.na(x$year[i])) {
      output <- paste0(output, x$day[i], dot, x$month[i], dot, x$year[i], br)
      }
    } else {
      # 3: 30°16'31.4"S 149°51'46.4"E
      if (!is.na(x$gps_coordinates[i])) {
        output <- paste0(output, x$gps_coordinates[i], br)
      }
      if (!is.na(x$day[i]) & !is.na(x$month[i]) & !is.na(x$year[i])) {
        output <- paste0(output, x$day[i], dot, x$month[i], dot, x$year[i])
      }
      if (!is.na(x$collector[i])) {
        # 4: 11.ix.2024, Tracy Yao
        output <- paste0(output, comma, x$collector[i], br)
      } else {
        # 4: 11.ix.2024 (missing collector)
        output <- paste0(output, br)
      }
    }
  # 5: In ungrazed pasture
  if (!is.na(x$location_notes[i])) {
    output <- paste0(output, x$location_notes[i], br, br)
  } else {
    output <- paste0(output, br)
  }
}

output <- paste0(output, br)

# copy output to clipboard
clipr::write_clip(output)

# Output ####
finished()
thanks