library(tidyverse)


p_to_lsoa = read_csv("Obtained/postcode-to-lsoa.csv")
colnames(p_to_lsoa)

cleaned_housing = read_csv("Cleaned/housing_cleaned.csv")
county_data = cleaned_housing %>% 
  select(Postcode,ShortPC,County,Town,District)
cleaned_housing
code_to_county = p_to_lsoa %>% 
  select(pcd7,lsoa11cd) %>% 
  rename(Postcode=pcd7,`LSOA Code`=lsoa11cd) %>% 
  right_join(county_data,by="Postcode") %>% 
  distinct()
code_to_county
cleaned_housing

write_csv(code_to_county,"Cleaned/pcode_lsoa_cleaned.csv")
