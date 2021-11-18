feature "booking a room" do
    scenario "Shows room requested" do
        visit('/booked')
        expect(page).to have_content "Room Requested"
    end
end

feature "Updating available status" do
    scenario "A guest can book a room" do
        space = Space.create(name: "Windsor Castle")
        visit('/spaces')
        expect(page).to have_content "Windsor Castle"
        within_fieldset("Windsor Castle") do
          click_button "Request booking"
        end
    end
end