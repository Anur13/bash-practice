#!/bin/bash   


pathFromfile="$1"
pathTofile="$2"


if [ -z "$pathTofile" ];then
  echo "Path to file was not provided"
  exit
fi

if [ -z "$pathFromfile" ];then
  echo "Path from file was not provided"
  exit
fi



while IFS= read -r line
do
  echo "$line" >> "$pathTofile"
done < "$pathFromfile"


# < (Input Redirection)
#  • Purpose: Redirects input to a command from a file.
#  • Usage: Provides the content of a file as input to a command.
#  • Example:

# cat < file.txt

# Reads the contents of file.txt and displays it.

# > (Output Redirection)
#  • Purpose: Redirects the output of a command to a file, overwriting the file if it exists.
#  • Usage: Saves the output of a command to a file.
#  • Example:

# echo "Hello, world!" > output.txt

# Writes "Hello, world!" into output.txt, overwriting the file if it exists.

# Key Differences

# Operator Direction Use Case
# < Input Feeds a file’s content as input to a command.
# > Output Writes a command’s output to a file.

# Combined Example

# sort < input.txt > output.txt

#  • < input.txt: Provides input.txt as input to the sort command.
#  • > output.txt: Saves the sorted output into output.txt.

# https://serverfault.com/questions/196734/bash-difference-between-and-operator


# In Bash, **single square brackets (`[ ]`)** and **double square brackets (`[[ ]]`)** are both used for evaluating conditional expressions, but they have important differences. Double square brackets (`[[ ]]`) provide more advanced features, making them a more flexible and powerful option for conditional testing. Here's a comparison of the two:

# ### 1. **Single Square Brackets (`[ ]`)**
# The single square brackets are a synonym for the `test` command, which is used to evaluate conditions such as file existence, string comparisons, and numeric comparisons.

# #### Characteristics of `[ ]`:
# - **No logical operators**: You can combine conditions using logical operators like `-a` (AND) and `-o` (OR), but these are less flexible and can be error-prone.
# - **String comparison**: String comparison uses `=` or `!=`.
# - **File tests**: Standard file tests like `-f`, `-d`, `-e`, etc.
# - **Strict syntax**: Requires proper spacing between brackets and operators.
  
# #### Examples:

# - **String comparison**:
#   ```bash
#   str1="apple"
#   str2="orange"
#   if [ "$str1" = "$str2" ]; then
#       echo "They are equal"
#   else
#       echo "They are not equal"
#   fi
#   ```

# - **File test**:
#   ```bash
#   if [ -f "myfile.txt" ]; then
#       echo "File exists"
#   fi
#   ```

# - **Logical AND/OR** (less flexible):
#   ```bash
#   if [ "$str1" = "apple" -a "$str2" = "orange" ]; then
#       echo "Both conditions are true"
#   fi
#   ```

# #### Limitations:
# - **No support for pattern matching**: The single square brackets do not support pattern matching using `==` (except for simple string matching).
# - **No support for multiple conditions** with more advanced operators (like `&&` or `||`).

# ### 2. **Double Square Brackets (`[[ ]]`)**
# Double square brackets provide more advanced functionality and are more feature-rich than single square brackets. They are a Bash **keyword** (not a command) and offer a wider range of capabilities.

# #### Characteristics of `[[ ]]`:
# - **String comparison**: Supports more powerful string comparisons, including pattern matching with `==` and `!=`.
# - **Logical operators**: Supports `&&` (AND) and `||` (OR), making it easier to combine multiple conditions.
# - **No need for quoting variables**: You do not need to quote variables inside `[[ ]]`, even if they contain spaces, because `[[ ]]` handles it automatically.
# - **Pattern matching**: `[[ ]]` allows pattern matching with `==` and `!=`, and supports glob-style patterns (e.g., `*`, `?`).
# - **No word splitting or filename expansion**: Unlike `[ ]`, `[[ ]]` does not perform word splitting or filename expansion, which helps avoid unexpected behavior.

# #### Examples:

# - **String comparison with `==` (supports glob matching)**:
#   ```bash
#   str="apple"
#   if [[ "$str" == a* ]]; then
#       echo "The string starts with 'a'"
#   fi
#   ```

# - **String comparison with `!=`**:
#   ```bash
#   str="apple"
#   if [[ "$str" != "orange" ]]; then
#       echo "The string is not 'orange'"
#   fi
#   ```

# - **Logical AND/OR (with `&&` and `||`)**:
#   ```bash
#   if [[ "$str1" = "apple" && "$str2" = "orange" ]]; then
#       echo "Both conditions are true"
#   fi
#   ```

# - **Pattern matching**:
#   ```bash
#   filename="testfile.txt"
#   if [[ "$filename" == *.txt ]]; then
#       echo "This is a text file"
#   fi
#   ```

# - **No need to quote variables**:
#   ```bash
#   str="Hello World"
#   if [[ $str == "Hello World" ]]; then
#       echo "String matches"
#   fi
#   ```

# #### Advantages of `[[ ]]` over `[ ]`:
# - **Pattern matching**: The ability to use wildcards (e.g., `*`, `?`) with `==` is very useful for pattern matching.
# - **Safer syntax**: You don't need to quote variables to avoid issues with spaces or special characters. This reduces the chance of bugs.
# - **Logical operators**: The support for `&&` and `||` simplifies combining multiple conditions.

# ### Summary of Key Differences:

# | Feature                          | Single Square Brackets (`[ ]`)         | Double Square Brackets (`[[ ]]`)             |
# |-----------------------------------|---------------------------------------|---------------------------------------------|
# | **Command or Keyword**            | `test` command                        | Bash **keyword**                            |
# | **String Comparison**             | `=` and `!=`                          | `==` (supports pattern matching)            |
# | **Pattern Matching**              | Not supported                         | Supported with `==` and `!=` (glob patterns) |
# | **Logical Operators**             | `-a` (AND), `-o` (OR)                 | `&&` (AND), `||` (OR)                       |
# | **Variable Expansion**            | Must quote variables (`"$var"`)       | No need to quote variables                  |
# | **Word Splitting / Globbing**     | Yes (can cause problems with spaces)  | No (safer, avoids word splitting issues)    |
# | **Use Case**                      | Simple conditions, file tests, etc.   | Complex conditions, pattern matching, logical operators |

# ### Best Practices:
# - **Use `[[ ]]`** when you need advanced features like pattern matching, logical operators, or when you want safer, cleaner syntax (especially when working with variables).
# - **Use `[ ]`** for simpler test cases, but be careful with quoting variables and the handling of special characters.

# In general, it's recommended to use `[[ ]]` in Bash scripts unless you have a specific need for the behavior of `[ ]` (such as portability to more POSIX-compliant shells).