# The Health Inequality Project
# https://healthinequality.org/
# and
# The Drug Gene Interaction Database
# http://www.dgidb.org/
#
# Data - direct download exercise

# Here are some URLs. As you can see they're just normal strings

# US National Life expectancy estimates by Gender and Income Percentile
gender_income_url <- "https://healthinequality.org/dl/health_ineq_online_table_1.csv"

# TSV download of all drug-gene interactions in DGIdb from all sources that were mapped to Entrez genes. 
gene_drug_url <- "https://www.dgidb.org/data/latest/interactions.tsv"

# Read a file in from the first URL and assign it to gender_income_data
gender_income_data <- read.csv(gender_income_url)

# Read a file in from the second URL and assign it to gene_drug_data
gene_drug_data <- read.delim(gene_drug_url)

# Examine the objects with head()
head(gender_income_data)
head(gene_drug_data)
