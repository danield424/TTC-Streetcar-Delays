#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Daniel Du
# Date: 24 September 2024
# Contact: danielc.du@mail.utoronto.ca
# License: MIT
# Pre-requisites: Simulated and tested data
# Any other information needed? N/A


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
# get package
package <- show_package("b68cb71b-44a7-4394-97e2-5d2f41462a5d")
package

# Find xlsx file
resources <- list_package_resources("b68cb71b-44a7-4394-97e2-5d2f41462a5d")
datastore_resources <- filter(resources, tolower(format) == 'xlsx')

#### Save data ####
streetcar_delay_data2022 <- filter(datastore_resources, name == "ttc-streetcar-delay-data-2022") %>% get_resource()
streetcar_delay_data2023 <- filter(datastore_resources, name == "ttc-streetcar-delay-data-2023") %>% get_resource()
streetcar_delay_data2024 <- filter(datastore_resources, name == "ttc-streetcar-delay-data-2024") %>% get_resource()

write_csv(streetcar_delay_data2022, "data/raw_data/streetcar_delays2022.csv")
write_csv(streetcar_delay_data2023, "data/raw_data/streetcar_delays2023.csv")
write_csv(streetcar_delay_data2024, "data/raw_data/streetcar_delays2024.csv")
