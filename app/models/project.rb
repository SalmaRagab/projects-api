class Project < ApplicationRecord
    enum status: { planned: 0, active: 1, done: 2, failed: 3 }
end
