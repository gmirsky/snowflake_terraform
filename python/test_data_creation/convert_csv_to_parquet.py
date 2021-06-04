import pandas as pd
df = pd.read_csv("./snowflake_test_table_data.csv")
df.to_parquet("./snowflake_test_table_data.parquet")