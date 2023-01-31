def booleanize(value) -> bool:
    if value is None:
        return False

    falsy = ["no", "n", "0", "false"]
    truly = ["yes", "y", "1", "true"]

    if value.lower() in falsy:
        return False
    elif value.lower() in truly:
        return True
    else:
        raise TypeError("Non boolean-like value {}".format(value))