class OWorker < ApplicationRecord
  self.table_name = 'one_workers'
end

class OGroup < ApplicationRecord
  self.table_name = 'one_worker_groups'
end

class OTask < ApplicationRecord
  self.table_name = 'one_tasks'
end

class OTaskDetail < ApplicationRecord
  self.table_name = 'one_task_details'
end
