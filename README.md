Basically, this script breaks pptx passwords (or rather, creates a new WaReZ copy of them).

Created out of necessity for the Technion's 234218 Data Structures course.

The idea was shameless stolen directly from [this repo](https://github.com/nedlir/OfficerBreaker/).

# How to use
Simply run the script as following:
```console
./pptx-breaker.sh READ_ONLY_PRESENTATION.pptx
```

You can even run this script on multiple files, for example:
```console
#!/bin/bash
for presentation in *; do
  ../pptx-breaker.sh "$file"
done
```

Good luck on your tests and happy printing!
