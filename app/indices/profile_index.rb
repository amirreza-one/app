ThinkingSphinx::Index.define :profile, :with => :active_record do
  indexes [:firstname,:lastname]
  indexes user.email, as: :email
end