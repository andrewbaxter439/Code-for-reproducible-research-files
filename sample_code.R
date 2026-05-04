library(tidyverse)

df <- read_csv("C:/reproducible_research_project/Code_for_reproducible_research_files/sample_data.csv")

region_codes <- tribble(
  ~code, ~region_name,
  1, "North East",
  2, "North West",
  3, "Yorkshire and the Humber",
  4, "East Midlands",
  5, "West Midlands",
  6, "East of England",
  7, "London",
  8, "South East",
  9, "South West",
  10, "Wales",
  11, "Scotland",
  12, "Northern Ireland"
)

df2 <- df |> 
  mutate(
    bmi = weight/(height / 100)^2,
    dist = if_else(hm >= 3, 1, 0),
    depr = if_else(hm >= 4, 1, 0),
    qual = case_when(
      educ %in% 1:3 ~ "Low",
      educ %in% 4:8 ~ "Medium",
      educ %in% 9:12 ~ "High"
    ),
    active = if_else(exerc == 0, "No", "Yes")
  ) |> 
  left_join(region_codes, by = join_by(region == code)) |> 
  filter(age %in% 18:65)

df2 |> 
  ggplot(aes(age)) +
  geom_bar()

df2 |> 
  ggplot(aes(bmi)) +
  geom_histogram() +
  facet_wrap(~gender)

t.test(bmi ~ gender, data = df2)


(mod1 <- lm(hm ~ active, data = df2))

(mod2 <- lm(hm ~ educ, data = df2))

(mod3 <- lm(hm ~ qual, data = df2))

(mod4 <- lm(hm ~ active*gender + educ + region_name, data = df2))

(mod5 <- glm(dist ~ active*gender + educ + region_name, data = df2))

(mod6 <- glm(depr ~ active*gender + educ + region_name, data = df2))
