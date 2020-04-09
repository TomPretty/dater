# dater

A simple cli for getting formatted dates.

## Usage

```bash
dater PATTERN
```

Where `PATTERN` can be:

| `PATTERN`                       | Result                               |
| ------------------------------- | ------------------------------------ |
|                                 | today                                |
| `yday, yesterday`               | yesterday                            |
| `tmr, tomorrow`                 | tomorrow                             |
| `m, mon, monday`                | this monday                          |
| `(l, last)-(m, mon, monday)`    | last monday                          |
| `(n, next)-(m, mon, monday)`    | next monday                          |
| `t, tue, tuesday`               | this tuesday                         |
| `(l, last)-(t, tue, tuesday)`   | last tuesday                         |
| `(n, next)-(t, tue, tuesday)`   | next tuesday                         |
| `w, wed, wednesday`             | this wednesday                       |
| `(l, last)-(w, wed, wednesday)` | last wednesday                       |
| `(n, next)-(w, wed, wednesday)` | next wednesday                       |
| `th, thu, thursday`             | this thursday                        |
| `(l, last)-(th, thu, thursday)` | last thursday                        |
| `(n, next)-(th, thu, thursday)` | next thursday                        |
| `f, fri, friday`                | this friday                          |
| `(l, last)-(f, fri, friday)`    | last friday                          |
| `(n, next)-(f, fri, friday)`    | next friday                          |
| `s, sat, saturday`              | this saturday                        |
| `(l, last)-(s, sat, saturday)`  | last saturday                        |
| `(n, next)-(s, sat, saturday)`  | next saturday                        |
| `su, sun, sunday`               | this sunday                          |
| `(l, last)-(su, sun, sunday)`   | last sunday                          |
| `(n, next)-(su, sun, sunday)`   | next sunday                          |
| `(d)d`                          | given day for current month          |
| `(m)m-(d)d`                     | given month and day for current year |
| `(yy)yy-(m)m-(d)d`              | given date                           |

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
