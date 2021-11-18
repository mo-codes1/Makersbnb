feature "booking a room" do
    scenario "Shows room requested" do
        visit('/booked')
        expect(page).to have_content "Room Requested"
    end
end

feature "Updating available status" do
    scenario "A guest can book a room" do
        space = Space.create(name: "Tudor house")
        visit('/spaces')
        expect(page).to have_content "Tudor house"
        within_fieldset("Tudor house") do
        click_button "Request booking"
        end
    end
end