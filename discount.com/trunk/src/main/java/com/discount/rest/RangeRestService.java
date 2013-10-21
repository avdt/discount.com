package com.discount.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.discount.domain.Range;
import com.discount.service.RangeService;

@Controller
@Path(RestUrls.RANGE_URL)
public class RangeRestService {

	@Autowired
	private RangeService rangeService;

	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	@Path("get/{id}")
	public List<Range> getAll(@PathParam("id") Integer id) {
		List<Range> ranges = rangeService.findByProducer(id);

		// FIXME: fix hibernate fetching
		for (Range range : ranges) {
			convert(range);
		}

		return ranges;
	}

	private void convert(Range range) {
		range.setProducts(null);
		range.getProducer().setCategories(null);
		range.getProducer().setProducts(null);
		range.getProducer().setRanges(null);
	}

}
