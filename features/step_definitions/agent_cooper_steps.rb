Given /^the following parameters:$/ do |table|
  table.hashes.each do |h|
    @request << h
  end
end

When /^I tape the "([^"]*)" request as: "([^"]*)"$/ do |service, operation|
  VCR.use_cassette("#{service}/#{operation}/#{cassette_name}", :record => :new_episodes) do
    @response = @request.get
  end
end

Then /^the response code should be "([^"]*)"$/ do |code|
  @response.code.should == code.to_i
end

Then /^the response should have (\d+) "([^"]*)" nodes$/ do |count, node|
  seek_in_hash(@response.to_hash, node).count == count.to_i
end
