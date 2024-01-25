library(tidyverse)

pcode_lsoa = read_csv("Cleaned/pcode_lsoa_cleaned.csv")

broadband_data = read_csv("Obtained/Broadband/broadband_speed.csv")

cleaned_broadband = broadband_data %>% 
  select('Average download speed (Mbit/s)', postcode_space) %>%  
  rename(Postcode= `postcode_space`) %>% 
  right_join(pcode_lsoa, by="Postcode") %>% 
  select('Average download speed (Mbit/s)',Postcode, `ShortPC`, `Town`, County,) %>% 
  na.omit() %>%  
  mutate(`ShortPC`= substr(Postcode, 1,5))

cleaned_broadband
# Saving the cleaned data set
write_csv(cleaned_broadband,"Cleaned/broadband_cleaned.csv") 
