select
  state,
  printf('%.02f', 1.0 * sum(votes) / 1000000) || ' million' as total_votes,
  sum(votes) as sum_votes
from
  results
  join fips on(fips.fips_char = results.fips_char)
group by
  state
order by
  1.0 * sum_votes desc;

-- parties
select
  state,
  party,
  votes
from
  results
  join fips on(fips.fips_char = results.fips_char)
where
  party = 'DEM'
  or party = 'REP'
group by
  state,
  party
order by
  state asc,
  party asc;


select
  state,
  sum(votes),
  sum(votes) filter(where party='DEM') dem_votes,
  sum(votes) filter(where party='REP') rep_votes
from
  results
  join fips on(fips.fips_char = results.fips_char)
where
  party = 'DEM'
  or party = 'REP'
group by
  state
order by
  state asc;
