class AddSectionTestDate < ActiveRecord::Migration
  def self.up
    p1=Section.create(:name  => "p1",:path  => "/p1",:parent_id  => 1)
    Section.create(:name  => "p2",:path  => "/p2",:parent_id  => 1)
    Section.create(:name  => "p3",:path  => "/p3",:parent_id  => 1)
    Section.create(:name  => "p4",:path  => "/p4",:parent_id  => 1)
    Section.create(:name  => "p5",:path  => "/p5",:parent_id  => 1)
    
    Section.create(:name  => "pp1",:path  => "/pp1",:parent_id  => p1.id)
    pp2 = Section.create(:name  => "pp2",:path  => "/pp1",:parent_id  => p1.id)
    Section.create(:name  => "ppp1",:path  => "/pp1",:parent_id  => pp2.id)
    
    
  end

  def self.down
  end
end
