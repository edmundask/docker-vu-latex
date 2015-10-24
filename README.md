# Docker image for generating LaTeX documents

Since setting up LaTeX on, for example, Mac OSX may be a chore, hopefully this will make it easier.

The image includes these packages:

* texlive-full
* biber
* python-pygments
* gnuplot

It also comes equiped with **Palemonas** (*v2.1*) font.

## Setup

Get the image:

```
docker pull edmundask/vu-latex
```

## Usage

For ultimate flexibility, you'll mostly want to use `cmd.sh` as your starting point.

```
./cmd.sh xelatex <args>
```

For example:

```
./cmd.sh xelatex example.tex
./cmd.sh biber example
./cmd.sh xelatex example.tex
```

Alternatively, you can use the existing `Makefile` to your advantage (it's a bit sketchy, fits my needs). 
The important thing to keep in mind is to place your LaTeX file in `src/` directory and name it `src/document.tex`. 
The generated PDF file will appear in `dist/` after running:

```
make generate
```

Then you can open it: `make show`.

# Copyright

The sample LaTeX code was taken from [LIKS/thesis_template_v2_vu_mif_cs2](https://github.com/LIKS/thesis_template_v2_vu_mif_cs2).

Feel free to do whatever you want with this repo. Cheers!


