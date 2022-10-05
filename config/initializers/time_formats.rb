Time::DATE_FORMATS[:normal] = '%d %b %Y'
Time::DATE_FORMATS[:short_ordinal] = ->(time) { time.strftime("%B #{time.day.ordinalize}") }
