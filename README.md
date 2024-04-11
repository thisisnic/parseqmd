## Nic's to-do list

features:
1. manip like a list?
2. represent in a table
3. extract all code chunks
4. extract by name
5. print AST

## Usage

```r
cloud_rendered <- parse_qmd("../scaling_up_with_r_and_arrow/cloud.qmd")

print_tree(cloud_rendered)

View(extract_to_table(cloud_rendered))
```
