feature "booking a room" do
    scenario "Shows room requested" do
        visit('/booked')
        expect(page).to have_content "Room Requested"
    end
end

feature "Updating available status" do
    scenario "A guest can book a room" do
        space = Space.create(name: "Windsor Castle", owner_name: "Jeff", price: "100", description: "Spacious")
        visit('/spaces')
        expect(page).to have_content "Windsor Castle"
        within_fieldset("Windsor Castle") do
          click_on('book')
        end
        expect(page).to have_content "Room Requested"
    end
end