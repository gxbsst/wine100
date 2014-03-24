
FactoryGirl.define do
  factory :wine100_wine, :class => Refinery::Wine100Wines::Wine100Wine do
    sequence(:style) { |n| "refinery#{n}" }
  end
end

