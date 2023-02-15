Basically, this script makes locked-down, read-only PPTX files editable.

Created out of necessity for the Technion's 234218 Data Structures course.

The idea was shamelessly stolen directly from [this repo](https://github.com/nedlir/OfficerBreaker/).

# How to use
Simply run the script as following:
```bash
./pptx-breaker.sh READ_ONLY_PRESENTATION.pptx
```

You can even run this script on multiple files, for example:
```bash
#!/bin/bash
for presentation in *; do
  ./pptx-breaker.sh "$presentation"
done
```

Good luck on your tests and happy printing!
