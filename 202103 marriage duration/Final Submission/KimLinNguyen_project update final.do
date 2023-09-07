clear all
capture log close
cd "/Users/sungjukim/Desktop/Sophomor Yr 21-22/Data Analysis/Data group project"
log using Datagroupproject1.log, replace
use divorce_data_original.dta

***Data Cleaning****

* Drop the irrelevant variables to the research question
#delimit ;
drop 
nationality_partner_man 
dob_partner_man 
place_of_birth_partner_ma  
birth_municipality_of_partner_ma
birth_federal_partner_man
birth_country_partner_man
residence_municipality_partner_m
residence_federal_partner_man
residence_country_partner_man
occupation_partner_man
place_of_residence_partner_man
nationality_partner_woman
dob_partner_woman
dob_registration_date_partner_wo
place_of_birth_partner_woman
birth_municipality_of_partner_wo
birth_federal_partner_woman
birth_country_partner_woman
place_of_residence_partner_woman
residence_municipality_partner_w
residence_federal_partner_woman
residence_country_partner_woman
occupation_partner_woman
marriage_certificate_place
marriage_certificate_municipalit
marriage_certificate_federal
marriage_duration_months
employment_status_partner_man
employment_status_partner_woman;
#delimit cr


* Generate a dummy variable for the legalization of unilateral divorce in 2008
describe divorce_date
split divorce_date, destring parse(/)
rename divorce_date3 divorceyr
drop divorce_date1 divorce_date2
summarize divorceyr // to double check
gen unilateral = 0
replace unilateral = 1 if divorceyr >= 8

* Convert string variables into categorical variables 
generate husbandedu = .
replace husbandedu = 0 if level_of_education_partner_man == "SIN ESCOLARIDAD"
replace husbandedu = 1 if level_of_education_partner_man == "PRIMARIA"
replace husbandedu = 2 if level_of_education_partner_man == "SECUNDARIA"
replace husbandedu = 3 if level_of_education_partner_man == "PREPARATORIA"
replace husbandedu = 4 if level_of_education_partner_man == "PROFESIONAL"

generate wifeedu = .
replace wifeedu = 0 if level_of_education_partner_woman == "SIN ESCOLARIDAD"
replace wifeedu = 1 if level_of_education_partner_woman == "PRIMARIA"
replace wifeedu = 2 if level_of_education_partner_woman == "SECUNDARIA"
replace wifeedu = 3 if level_of_education_partner_woman == "PREPARATORIA"
replace wifeedu = 4 if level_of_education_partner_woman == "PROFESIONAL"

generate divorcetype = .
replace divorcetype = 0 if type_of_divorce == "Necesario"
replace divorcetype = 1 if type_of_divorce == "Voluntario"

generate childcustody = .
replace childcustody = 0 if custody == "MADRE"
replace childcustody = 1 if custody == "PADRE"
replace childcustody = 2 if custody == "OTRO"

* Rename relevant variables
rename age_partner_man husbandage
rename age_partner_woman wifeage
rename num_children children
rename marriage_duration marriageduration
drop level_of_education_partner_man
drop level_of_education_partner_woman
drop custody
rename childcustody custody
drop type_of_divorce
drop divorce_date
rename monthly_income_partner_man_peso husband_mincome
rename monthly_income_partner_woman_pes wife_mincome

* Report summary statistics
asdoc summarize, save(Table1.doc), replace

* Report all missing values ***
asdoc missings report, save(Missingvalues.doc), replace

*** Check potential violation of Gauss-Markov assumption & Run preliminary OLS

* Graph matrix of all variables 
graph matrix marriageduration husbandage husband_mincome wifeage wife_mincome children husbandedu divorcetype wifeedu custody unilateral
graph export "lineargraphmatrix.jpg", replace


* Run OLS
reg marriageduration husbandage husband_mincome wifeage wife_mincome children husbandedu divorcetype wifeedu custody unilateral 
asdoc reg marriageduration husbandage husband_mincome wifeage wife_mincome children husbandedu divorcetype wifeedu custody unilateral, nest save(initialreg.doc), replace 

* Check multicollinearityg
vif
asdoc vif, save(multicollinearity.doc), replace
estat imtest, white
asdoc estat imtest, white save(whitestest.doc) replace


*** Income Variables Improvement

* Scaling monthly income variables of both husband and wife
gen scale_husband_mincome = husband_mincome / 100000
gen scale_wife_mincome = wife_mincome / 100000

* Histogram of husband income
#delimit ;
histogram scale_husband_mincome, //idk how to change this part
name(graph1, replace) 
graphregion(fcolor(white)) 
msize(vsmall) 
title("Histogram of husband monthly income");
#delimit cr
graph export hmonthlyincome.jpg, replace


* Clear the outliers for income variables
summarize scale_husband_mincome, detail
keep if inrange(scale_husband_mincome, r(p1), r(p99))
summarize scale_wife_mincome, detail
keep if inrange(scale_wife_mincome, r(p1), r(p99))

* Histogram of husband income after adjusting for extreme values
#delimit ;
histogram scale_husband_mincome,
name(graph2, replace)
graphregion(fcolor(white)) 
msize(vsmall) 
title("Histogram of adjusted husband monthly income");
#delimit cr
graph export adjsthmonthlyincome.jpg, replace

regress marriageduration husbandage scale_husband_mincome wifeage scale_wife_mincome children husbandedu divorcetype wifeedu custody unilateral // Do regression again now husband income is significant and wife's is not
asdoc regress marriageduration husbandage scale_husband_mincome wifeage scale_wife_mincome children husbandedu divorcetype wifeedu custody unilateral, nest save(regofscaledincome.doc), replace

summarize scale_husband_mincome, detail 
summarize scale_wife_mincome, detail 


*** Try combined income variables
gen scale_family_mincome = scale_husband_mincome + scale_wife_mincome
summarize scale_family_mincome, detail 
regress marriageduration husbandage scale_family_mincome wifeage children husbandedu divorcetype wifeedu custody unilateral
// Adjusted and scaled family income is not significant

*** Regression Result (Combined)
#delimit;
asdoc regress marriageduration husbandage wifeage scale_husband_mincome scale_wife_mincome children husbandedu wifeedu divorcetype custody unilateral,
	nest
	stat(r2_a)
	dec(3)
	save(AsdocTable.doc)
	replace;
asdoc regress marriageduration husbandage wifeage scale_husband_mincome children husbandedu wifeedu divorcetype custody unilateral,
	nest
	stat(r2_a)
	dec(3)
	save(AsdocTable.doc)
	append;
asdoc regress marriageduration husbandage wifeage scale_husband_mincome scale_wife_mincome children husbandedu wifeedu custody unilateral,
	nest
	stat(r2_a)
	dec(3)
	save(AsdocTable.doc) 
	append;
asdoc regress marriageduration husbandage wifeage scale_husband_mincome scale_wife_mincome children husbandedu wifeedu divorcetype unilateral,
	nest
	stat(r2_a)
	dec(3)
	save(AsdocTable.doc) 
	append;
asdoc regress marriageduration husbandage wifeage scale_husband_mincome scale_wife_mincome children husbandedu wifeedu divorcetype custody, 
	nest
	stat(r2_a)
	dec(3)
	save(AsdocTable.doc) 
	append;
asdoc regress marriageduration husbandage wifeage scale_husband_mincome children husbandedu wifeedu,
	nest
	stat(r2_a)
	dec(3)
	save(AsdocTable.doc)
	append;
asdoc regress marriageduration husbandage wifeage scale_family_mincome children husbandedu wifeedu,
	nest
	stat(r2_a)
	dec(3)
	save(AsdocTable.doc)
	append;
#delimit

*check heteroscadaticity and robus SE for model 4
regress marriageduration husbandage wifeage scale_husband_mincome scale_wife_mincome children husbandedu wifeedu divorcetype unilateral
estat imtest, white
asdoc estat imtest, white save(whitestestforfinal.doc) replace

regress marriageduration husbandage wifeage scale_husband_mincome scale_wife_mincome children husbandedu wifeedu divorcetype unilateral, robust
asdoc regress marriageduration husbandage wifeage scale_husband_mincome scale_wife_mincome children husbandedu wifeedu divorcetype unilateral, robust nest save(robustSEmodel7.doc) replace

log close


