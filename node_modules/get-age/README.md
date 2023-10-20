# get-age
[![Build Status](https://travis-ci.org/bsiddiqui/get-age.svg?branch=master)](https://travis-ci.org/bsiddiqui/get-age) [![Code Climate](https://codeclimate.com/github/bsiddiqui/get-age/badges/gpa.svg)](https://codeclimate.com/github/bsiddiqui/get-age) [![Version](https://badge.fury.io/js/get-age.svg)](http://badge.fury.io/js/get-age) [![Downloads](http://img.shields.io/npm/dm/get-age.svg)](https://www.npmjs.com/package/get-age)

get-age calculates the age in years for a given birth date

## Install
``
$ npm install --save get-age
``

## Usage
```js
var getAge = require('get-age')

getAge('1990-01-09')
// => 25
```

## API

#### `getAge(dateString)` -> `number`

##### dateString
*Required* <br>
Type: `date`

The birth date that you'd like to get the age of in iso format `YYYY-MM-DD`
