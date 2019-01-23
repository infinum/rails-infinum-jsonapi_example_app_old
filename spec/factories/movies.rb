FactoryBot.define do
  factory :movie do
    title { 'The Terminator' }
    released_at { Date.parse('26.10.1984.') }
    runtime { 107 }
    content_rating { ContentRating.restricted }
    storyline { 'A seemingly indestructible android is sent from 2029 to 1984 to assassinate a waitress, whose unborn son will lead humanity in a war against the machines, while a soldier from that war is sent to protect her at all costs.' } # rubocop:disable Metrics/LineLength
    budget { 6_400_000 }
  end
end
