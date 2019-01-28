describe Movie do
  it { is_expected.to have_many(:genres).through(:movie_genres) }

  it { is_expected.to validate_presence_of(:title) }
end
