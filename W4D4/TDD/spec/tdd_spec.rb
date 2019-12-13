require 'tdd'

describe Array do
    describe "::my_uniq" do
        it "returns an array with unique elements" do
            expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
        end

        it "returns [] if empty array is passed in" do
            expect([].my_uniq).to eq([])
        end

        it "does not modify original array" do
            expect { [1, 2, 3].my_uniq }.to_not change{ [1, 2, 3] }
        end
   end 

   describe "::two_sum" do
        it "returns 2D array of pairs of position that sum to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end

        it "returns [] if there are no pairs that sum to zero" do
            expect([-1, 0, 2, 3, 4].two_sum).to eq([])
        end
   end

   describe "::my_transpose" do
        it "returns transposed matrix" do
            expect([[0, 1, 2], [3, 4, 5], [6, 7, 8]].my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
        end

        it "returns input if length of row and column of 2D array is one" do
            expect([[1]].my_transpose).to eq([[1]])
        end
   end

   describe "::stock_picker" do
        it "returns the most profitable pair of days" do
            expect([5, 2, 3, 4, 1, 6].stock_picker).to eq([4, 5])
        end 

        it "returns the most profitable pair of days again" do
            expect([5, 2, 3, 4, 1].stock_picker).to eq([1, 3])
        end
   end
end
