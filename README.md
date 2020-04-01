# dater

A simple cli for getting formatted dates.

## Usage

```bash
dater PATTERN
```

Where `PATTERN` can be:

| `PATTERN`               | Result                               |
| ----------------------- | ------------------------------------ |
|                         | today                                |
| `yday`, `yesterday`     | yesterday                            |
| `tmr`, `tomorrow`       | tomorrow                             |
| `m`, `mon`, `monday`    | this monday                          |
| `t`, `tue`, `tuesday`   | this tuesday                         |
| `w`, `wed`, `wednesday` | this wednesday                       |
| `th`, `thu`, `thursday` | this thursday                        |
| `f`, `fri`, `friday`    | this friday                          |
| `s`, `sat`, `saturday`  | this saturday                        |
| `su`, `sun`, `sunday`   | this sunday                          |
| `(d)d`                  | given day for current month          |
| `(m)m-(d)d`             | given month and day for current year |
| `(yy)yy-(m)m-(d)d`      | given date                           |

Dates are printed out as `yyyy-mm-dd`, but this can be overwritten by setting
the `DATER_DATE_FORMAT` environment variable. The format string is passed
to the ruby `Date` class' `strftime` [method](https://apidock.com/ruby/Date/strftime), e.g.

```bash
DATER_DATE_FORMAT="%d-%m-%Y" dater
```

will print out today's date as `dd-mm-yyyy`.

## 'Install'

You can 'install' the script with

```bash
make
```

and 'uninstall' with

```bash
make clean
```

This just copies the file to `~/bin` without the file extension. I guess it
still counts as installation though.
