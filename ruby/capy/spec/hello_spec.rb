
describe "Meu primeiro script" do
    it "Visitar a página" do
        visit "/"
        #puts page.title
        expect(page.title).to eql "Training Wheels Protocol"
    end
end