local function convert_year(datetime)
    return (datetime.year - 2000) / 128.0;
end

local function convert_year_fixed(datetime)
    local year_month = datetime.month / 11.0;
    return ((datetime.year + year_month) - 2000) / 128.0;
end

local function convert_month(datetime)
    return (datetime.month -1) / 11.0;
end

local function convert_month_fixed(datetime)
    local month_day = datetime.day / 30.0;
    return ((datetime.month + month_day) -1) / 30.0;
end

local function convert_day(datetime)
    return (datetime.day -1) / 30.0;
end

local function convert_day_fixed(datetime)
    local day_hour = datetime.hour / 23.0;
    return ((datetime.day + day_hour) -1) / 30.0;
end

local function convert_hour(datetime)
    return datetime.hour / 23.0;
end

local function convert_hour_fixed(datetime)
    local hour_sec = datetime.second / 60.0 / 60.0;
    local hour_min = datetime.minute / 60.0;
    return (datetime.hour + hour_sec + hour_min) / 23.0;
end

local function convert_min(datetime)
    return datetime.minute / 60.0;
end

local function convert_min_fixed(datetime)
    local min_sec = datetime.second / 60.0;
    return (datetime.minute + min_sec) / 60.0;
end

local function convert_second(datetime)
    return datetime.second / 60.0
end

local function convert_second_fixed(datetime)
    local sec_millisec = datetime.millisecond / 1000;
    return (datetime.second + sec_millisec) / 60.0
end

local function convert_weekday(datetime)
    return datetime.weekday / 6.0;
end

return {
    year = {
        address = "/avatar/parameters/year",
        value_type = "float",
        value_function = convert_year,
    },
    year_fixed = {
        address = "/avatar/parameters/year_fixed",
        value_type = "float",
        value_function = convert_year_fixed,
    },

    month = {
        address = "/avatar/parameters/month",
        value_type = "float",
        value_function = convert_month,
    },
    month_fixed = {
        address = "/avatar/parameters/month_fixed",
        value_type = "float",
        value_function = convert_month_fixed,
    },

    day = {
        address = "/avatar/parameters/day",
        value_type = "float",
        value_function = convert_day,
    },
    day_fixed = {
        address = "/avatar/parameters/day_fixed",
        value_type = "float",
        value_function = convert_day_fixed,
    },

    weekday = {
        address = "/avatar/parameters/weekday",
        value_type = "float",
        value_function = convert_weekday,
    },


    hour = {
        address = "/avatar/parameters/hour",
        value_type = "float",
        value_function = convert_hour,
    },
    hour_fixed = {
        address = "/avatar/parameters/hour_fixed",
        value_type = "float",
        value_function = convert_hour_fixed,
    },

    min = {
        address = "/avatar/parameters/min",
        value_type = "float",
        value_function = convert_min,
    },
    min_fixed = {
        address = "/avatar/parameters/min_fixed",
        value_type = "float",
        value_function = convert_min_fixed,
    },

    second = {
        address = "/avatar/parameters/second",
        value_type = "float",
        value_function = convert_second,
    },
    second_fixed = {
        address = "/avatar/parameters/second_fixed",
        value_type = "float",
        value_function = convert_second_fixed,
    }
}
