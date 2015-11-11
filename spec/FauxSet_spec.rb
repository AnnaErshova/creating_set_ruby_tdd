require_relative '../FauxSet'
require 'rspec'

describe "FauxSet:" do

  before { @set = FauxSet.new }

  subject { @set}

  let(:empty_set) { FauxSet.new }
  let(:bogus_attribute_set) { FauxSet.new(1,2,3) }
  let(:creation_set) { FauxSet.new([1,2,3]) }
  let(:duplication_set) { FauxSet.new([1,2,3,2]) }
  let(:addition_set) { FauxSet.new([1,2,3,4,5]) }
  let(:subraction_set) { FauxSet.new([1,2,3,4,5,6]) }
  let(:deletion_set) { FauxSet.new([1,2,3,4]) }

  describe "Should respond to the following public instance methods:" do
    # insertion
    it { should respond_to(:add) }
    it { should respond_to(:<<) }
    # ...add more as necessary
  end

  context "CREATING a new FauxSet object:" do
    it "Should return an object of class FauxSet" do
      expect(empty_set.class).to eq(FauxSet)
    end
    it "Should be empty by default" do
      expect(empty_set).to be_empty
    end
    describe "Can be created with elements:" do
      it "raises an error if a FauxSet is not given an array as an argument" do
        expect{bogus_attribute_set}.to raise_error(ArgumentError)
      end
      describe "will contain elements from the array that was used to initialize it:" do
        it "will contain unique elements from the array" do
          expect(creation_set.length).to eq(3)
        end
        it "will omit duplicate elements from the array" do
          expect(duplication_set.length).to eq(3)
        end
      describe "Can contain one and only one nil value" do
        before(:each) {@nil_set = FauxSet.new([1,2,3])}
        it "FauxSet allows for one nil value" do
          @nil_set.add(nil)
          expect(@nil_set.include?(nil)).to be(true)
        end
        it "FauxSet allows for one and only one nil value" do
          @nil_set = @nil_set.add(nil)
          expect(@nil_set).to be(true)
        end
    end
      end
      describe "Elements can be various data types:" do
        it "Elements can be integers" do
          # insert code here
        end
        it "ELements can be strings" do
          # insert code here
        end
        it "Elements can be arrays" do
          # insert code here
        end
      end
    end
  end

  context "INSERTING elements to the FauxSet object:" do
    describe "Unique values can be added to a FauxSet object:" do
      it "#add adds an element to the FauxSet:" do
        expect{addition_set.add(6)}.to change{addition_set.length}.by(1)
        addition_set.add(6)
        expect(addition_set.include?(6)).to be(true)
      end
      it "#add does not add an element if already present in the FauxSet:" do
        addition_set.add(4)
        expect(addition_set.length).to eq(5) 
      end
      it "#add maintains insertion order" do
        addition_set.add(6)
        expect(addition_set.first).to eq(1) 
        expect(addition_set.pop).to eq(6) 
      end
    end
  end

  context "DELETING elements from the FauxSet object:" do
    describe "Values can be removed from a FauxSet object:" do
      it "#delete removes indicated value from the FauxSet, if present" do
        expect{deletion_set.delete(1)}.to change{deletion_set.length}.by(-1)
        expect(deletion_set.include?(1)).to be(false)
      end
      it "#delete returns original FauxSet if indicated value is not present" do
        expect{deletion_set.delete(5)}.to change{deletion_set.length}.by(0)
      end
      it "#pop returns last item in the FauxSet" do
        @set.add(1)
        expect(@set.pop).to eq(1)
      end
      it "#pop returns nil if FauxSet is empty" do
        expect(@set.pop).to eq(nil)
      end
      describe "FauxSet can be emptied entirely:" do
        it "#clear empties an FauxSet entirely" do
          @set.add(3)
          @set.clear
          expect(@set.length).to eq(0)
        end
      end
    end
  end

  context "SORTING elements in the FauxSet object:" do
    describe "FauxSet can be sorted:" do
      it "#sort sorts the FauxSet in specified order" do
        set1 = FauxSet.new([1,2,4,3])
        set2 = FauxSet.new([1,2,3,4])
        expect(set1.sort.to_h.keys).to eq(set2.sort.to_h.keys)
      end
    end
  end

  context "TRAVERSING a FauxSet object:" do
    describe "Number of elements in the FauxSet can be counted:" do
      before(:each) { @empty_set = FauxSet.new }
      it "#size returns zero if a FauxSet is empty" do
        expect(@empty_set.size).to eq(0)
      end
      it "#size returns an integer with element count" do
        @empty_set.add(1)
        expect(@empty_set.size).to eq(1)
      end
    end
    it "#to_array converts all elements of the FauxSet into an array" do
      s = FauxSet.new([1,2,3,4,5])
      a = s.to_array
      expect(a.class).to eq(Array)
    end
    it "#each iterates through a FauxSet:" do
      # insert code here
    end
  end

  context "SEARCHING a FauxSet object:" do
    describe "FauxSet can be checked for presence of a value" do
      it "#include? returns true is value is present in a FauxSet" do
        # insert code here
      end
      it "#include? returns false is value is not present in a FauxSet" do
        # insert code here
      end
    end
    describe "FauxSet can be checked for being empty:" do
      it "#empty? returns true if a FauxSet has no elements in it" do
        # insert code here
      end
      it "#empty? returns false if a FauxSet contains any elements" do
        # insert code here
      end
    end
  end

  context "MERGING a FauxSet object:" do
    # work with merge, intersect, proper_superset, superset, proper_subset, subset
  end

end