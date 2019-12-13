require "tower_of_hanoi"

describe TowerOfHanoi do
    subject(:tower) { TowerOfHanoi.new }

    describe "#initialize" do
        context "sets the rod one" do
            it "without argument passed in" do
                expect(tower.rod_1).to eq([1, 2, 3, 4, 5])
            end

            it "with argument passed in" do
                tower = TowerOfHanoi.new(7)
                expect(tower.rod_1).to eq([1, 2, 3, 4, 5, 6, 7])
            end
        end

        it "sets the rod two" do
            expect(tower.rod_2).to eq([])
        end

        it "sets the rod three" do
            expect(tower.rod_3).to eq([])
        end

        context "sets the size" do
            it "with argument passed in" do
                tower = TowerOfHanoi.new(6)
                expect(tower.size).to eq(6)
            end
            
            it "without argument passed in" do
                expect(tower.size).to eq(5)
            end
        end

        describe "#valid_move" do
            it "returns false if starting rod is empty" do
                expect(tower.valid_move?([],[1,2,3])).to eq(false)
            end

            it "returns true if starting rod is empty" do
                expect(tower.valid_move?([1,2,3], [])).to eq(true)
            end

            it "returns false if starting rod is empty" do
                expect(tower.valid_move?([4],[1,2,3])).to eq(false)
            end

            it "returns true if starting rod is empty" do
                expect(tower.valid_move?([0],[1,2,3])).to eq(true)
            end
        end



    end




end