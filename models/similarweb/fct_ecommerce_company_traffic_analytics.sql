with source_data as (
    select
        domain,
        total_visits,
        total_pages_per_visit,
        total_average_visits_duration,
        global_rank
    from raw_similarweb
    where yearmonth = '2022-03'
)

select
    source_data.domain as ecommerce_company_key,
    dim_ecommerce_company_history.ecommerce_company_hkey,
    'MAR_2022' as month_year,
    source_data.total_pages_per_visit as page_per_visit,
    source_data.global_rank,
    source_data.total_visits * source_data.total_pages_per_visit as monthly_visits --noqa
from source_data
inner join dim_ecommerce_company_history
    on source_data.domain = dim_ecommerce_company_history.ecommerce_company_key
