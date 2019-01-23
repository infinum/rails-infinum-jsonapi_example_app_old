# Fast JSONAPI Example
## Overview

### Pagination

You can specify page number and page size in the following format:
```
?page[number]=2&page[size]=1
```
Please start paginating from page 1, page 0 will also return the first page.

### Sorting

We support the JSON API standard for sorting parameters, described [here](http://jsonapi.org/format/#fetching-sorting).
For example the following query parameter: ```?sort=created_at``` or ```?sort=-created_at```.
Any attribute that is returned in the api calls is sortable.

### Filtering

We support the JSON API standard for filtering parameters, described [here](https://jsonapi.org/format/#fetching-filtering).
For example, you can use the following query parameter: ```?filter[:content_rating]=general_audiences```.

### Relationship Inclusion

We support the JSON API standard for relationship inclusion, described [here](http://jsonapi.org/format/#fetching-includes).
For example the following query parameter: ```?include=relationship_name```.
Any relationship that is returned in the api calls is includable.
There are also some default relationships included in the show endpoints for the resources.

### Sparse Fieldsets

We support the JSON API standard for returning only specific fields, described
[here](https://jsonapi.org/format/#fetching-sparse-fieldsets)
For example, you can use the following query parameter: ```?fields[movies]=title,runtime```.
