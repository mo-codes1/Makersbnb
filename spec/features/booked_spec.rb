feature "booking a room" do
    scenario "Shows room requested" do
        visit('/booked')
        expect(page).to have_content "Room Requested"
    end
end