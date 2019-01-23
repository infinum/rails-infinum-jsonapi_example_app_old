class ContentRating < Enumerations::Base
  value :general_audiences,
        code: 'G',
        name: 'General Audiences'
  value :parental_guidance_suggested,
        code: 'PG',
        name: 'Parental Guidance Suggested'
  value :parents_strongly_cautioned,
        code: 'PG-13',
        name: 'Parents Strongly Cautioned'
  value :restricted,
        code: 'R',
        name: 'Restricted'
  value :adults_only,
        code: 'NC-17',
        name: 'Adults Only'
end
