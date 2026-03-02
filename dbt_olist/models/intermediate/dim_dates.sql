-- Ví dụ tạo chuỗi ngày đơn giản trong BigQuery
with date_series as (
  select 
    date_day
  from unnest(generate_date_array('2016-01-01', '2019-12-31', interval 1 day)) as date_day
)

select
  date_day as date_key,
  extract(year from date_day) as year,
  extract(month from date_day) as month,
  extract(quarter from date_day) as quarter,
  extract(dayofweek from date_day) as day_of_week,
  format_date('%B', date_day) as month_name,
  format_date('%A', date_day) as day_name,
  case when extract(dayofweek from date_day) in (1, 7) then 'Weekend' else 'Weekday' end as is_weekend
from date_series