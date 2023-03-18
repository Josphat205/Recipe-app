# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'josee', email: 'josee@mail.com', password: 'password')
    Food.create(name: 'Corn', measurement_unit: 'grams', price: 2, user: @user)
  end

  before(:each) { subject.save }

  it 'should have name corn' do
    expect(subject.name).to_not eql('Maize')
  end

  it 'should have measurement unit grams' do
    expect(subject.measurement_unit).to eql('grams')
  end
  it 'should have price 2' do
    expect(subject.price).to eql(2)
  end
  it 'should have user josee' do
    expect(subject.user.name).to eql('josee')
  end
  it 'should not have user josee' do
    expect(subject.user.name).to_not eql('jose')
  end
  it 'should not have name nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should not have measurement unit nil' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end
  it 'should not have price nil' do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  it 'should not have user nil' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
  it 'should not have name nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'should not have measurement unit nil' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end
end
