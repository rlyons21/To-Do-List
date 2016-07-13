class New	

def New.bobs_task
		@bobs_task = New.where({"q1" => true})
		if results.empty?
			return nil
		else
			return Bob
		end
	end
end


def New.marys_task
		@marys_task = New.where({"q2" => true})
		if results.empty?
			return nil
		else
			return Mary
		end
	end
end

def New.joes_task
		@joes_task = New.where({"q3" => true})
		if results.empty?
			return nil
		else
			return Joe
		end
	end
end

def New.lisas_task
		@lisas_task = New.where({"q4" => true})
		if results.empty?
			return nil
		else
			return Lisa
		end
	end
end
