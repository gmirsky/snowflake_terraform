import pandas as pd
df = pd.read_csv("/Volumes/SeagateBackupPlusDrive/Gfk/s3/new1.csv")
df.to_parquet("/Volumes/SeagateBackupPlusDrive/Gfk/s3/new1.parquet")