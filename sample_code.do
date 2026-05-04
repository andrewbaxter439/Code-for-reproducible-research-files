import delimited "C:\reproducible_research_project\Code_for_reproducible_research_files\sample_data.csv", clear


lab define region_names ///
1 "North East" ///
2 "North West" ///
3 "Yorkshire and the Humber" ///
4 "East Midlands" ///
5 "West Midlands" ///
6 "East of England" ///
7 "London" ///
8 "South East" ///
9 "South West" ///
10 "Wales" ///
11 "Scotland" ///
12 "Northern Ireland"

lab values region region_names

gen bmi = weight / (height/100)^2

gen dist = (hm >= 3)
gen depr = (hm >= 4)

gen qual = .
replace qual = 1   if inrange(educ, 1, 3)
replace qual = 2   if inrange(educ, 4, 8)
replace qual = 3   if inrange(educ, 9, 12)

lab define qual_lab 1 "Low" 2 "Medium" 3 "High"
lab values qual qual_lab

gen active = 0
replace active = 1 if exerc != 0

lab define active_lab 1 "Yes" 0 "No"
lab values active active_lab

keep if inrange(age, 18, 65)


graph bar (count), over(age)

histogram bmi, by(gender)

ttest bmi, by(gender)


* Model 1
regress hm i.active

* Model 2
regress hm i.educ

* Model 3
regress hm i.qual

* Model 4
regress hm i.active##i.gender i.educ i.region

* Model 5
logit dist i.active##i.gender i.educ i.region

* Model 6
logit depr i.active##i.gender i.educ i.region
